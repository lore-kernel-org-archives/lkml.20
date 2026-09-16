Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9E248CD7F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603177; cv=none; b=QL28YZOdtzFNemH6WPZAtYNJKOj2x7GvYscRCyd93FnWSBca6Z8oZwDH7DUwJXONhJJjtmrj3Wc+W9v7ubmba2xvnFaOxetQIhTxBeOV00qXLP0qpHqItL4e3UO8yxV7XcEvGD5uAtrDwH1e05i04Fags5nVEaRFBoZ6d86ARNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603177; c=relaxed/simple;
	bh=iZDTSEutdlzrNt+HsK0gMg7KCjGzgbTctzIAFcA3ZWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n6N8Z+jaCwY4jQJFN7jVzFTDbyYeVoFaIMoQtVFsHuFC+PDdQD7s5AncCrxNS8yuDr7yDPUooO71TudjbCOnx50ojuy8fzOfrP7Oh/etKyHwMbGGJ5jP7gPyoyb2hDcppCQ45vJXV89tlOpYuo5fGfJd38XVYcl5hvbMWpD6sCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LEYFL6rs; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LEYFL6rs"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so94112a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603175; x=1790207975;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=V0OARD0PLF4mIwzcACpuZC6ushW9KkulR8L/wcLq6TE=;
        b=kfHMiLb4n0xwxU0F6c+it7wbV+FXLkr+/sFNWAl0Xyrpse7VLvCmvhH6aX/DjhTVEE
         Zq2XzJhbIFqhBxc9QKuz5GScL3uZXSsb3El6DijKpmbhrqh9b6TZRcK3wVr7EvSzWInE
         aSRTiKShkQNGZT4az0ft5w34fiiBGZM1AARG+7oRDnAtJujPKNdRaHyoTuSHT326jba+
         ruTaxryYrPcnlMVFP6+XNpKOooGCKeEe3YLvDfBiUyzxCuYJ1AtHALzaHNFwS+QDgIqH
         gY/Q2LRYedeACwOoF1jZo3ELjxwliWJf3isc4ukvwFESjOwS03NnuGozSLbD/H6ofS+d
         JGng==
X-Forwarded-Encrypted: i=1; AKwUvBxwk9c2ULM0f+JNFC+ccA6cm2q2GaS02P4hK3HdKrVTlY6ccWfZGV4a/bqbkUuTXxMzNXRRcC9WWOAQ7W0=@vger.kernel.org
X-Gm-Message-State: AFuF++lXLpHQVM57+vpf4rTPTj5cYRwOvp7OTabsWYF3cNN+KMkyHQZ/
	HCQ/ivlh3Mjie82ytxim4vNEjAMi2clrbWkvKN+WLtWM5F6zvW+4sOlJE+gt2ck3dzqJYRl+sO1
	qMVVnWMuT+pFwzZCoUguoOVEqXgD7lAP9eOVGizVvtzTZ0pfxn9Wkxvj+dqIQc88r1u1uH3UjlM
	VM1fV8PgXL/tUqPbR1JslXx1WRnXWLKsHveFEKDBZr6XZPq5OAkDblAs6ZjxFiOw0BJpOww70sh
	wcPjZ+XuQ6bV4F3A0NJIYmn
X-Gm-Gg: AYBFou0E6l8ecNvPJldz/9RZ4T3M4OyelHKcp5tMxs7vTFUcad4Eo62NDdZlHjMxY3b
	IYqHBSiCvMKxuhhCvXAI5Q6NDp9IdwMVaIzMfhfVdSOnobjCLv4I2SPRMHC4iBEUfwt8uN7pUM3
	xrReb8gUDjdXxGxXTN5oCwCaiw5k60QQgXED7ZfN5Fr02ncB9Eckle7fXe8/WfVnx4Me2yzQBRe
	UGs/9qnbMBS3mlYGDVCliCg3Us2o9Ol9Vy02hqv/Vc+wA6QafVDImku4XGeCR4GWg7sa49WcWPw
	+WJ21/yA1cT65PNMabVjszBDG/LfkCYc0WjucE5ENXYJ1Hr0L0CkVtlh6U/RB+dZ7/sLWyHsiux
	JHdLaXYnQ5L/EThrYoG4czsnHBuu8pRnuh/u2cSMZ01ikVZO8sqCb+OpfncLzGODZVQLuFeAjc3
	RjfLRP33VorsykGuxcNfQbnZXxlJNnMvVhZbTT1h/l/nI=
X-Received: by 2002:a17:90a:1189:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-39e21a761b4mr6613328a91.24.1789603174902;
        Wed, 16 Sep 2026 16:59:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e35d7c196sm560344a91.2.2026.09.16.16.59.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 16:59:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1a439db36so214501a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789603173; x=1790207973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0OARD0PLF4mIwzcACpuZC6ushW9KkulR8L/wcLq6TE=;
        b=LEYFL6rsQkD1A3c7ONFpHBihET+pNZcB87/twudVGqsDB0slzUmKc61lGKQJbRqFdp
         G/jqFjY26fhX5YJgin6V30Q+9GABBtFFWPDWltD7aze0Rv/h+JWCv/6Z5kaRp/XcwgPj
         vmL++FjuuB26s6N5eGBAGwcHwoC4tmwsxDU8o=
X-Forwarded-Encrypted: i=1; AKwUvBy3W5AHTt8gq7NcZ6CcngMWvw+Mltl7aLsBkXFYeVeLP9/kKG/4f5QwVIN9p3hwn49vT64w+ZQWWrP/K7g=@vger.kernel.org
X-Received: by 2002:a05:6a20:e212:b0:3cd:7ba2:e669 with SMTP id adf61e73a8af0-3dd5f45d85bmr11067014637.10.1789603172972;
        Wed, 16 Sep 2026 16:59:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:e212:b0:3cd:7ba2:e669 with SMTP id adf61e73a8af0-3dd5f45d85bmr11066949637.10.1789603172424;
        Wed, 16 Sep 2026 16:59:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm11074324eec.9.2026.09.16.16.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 16:59:31 -0700 (PDT)
Message-ID: <9a741390-503b-403d-a34d-d4919edf1d8c@broadcom.com>
Date: Wed, 16 Sep 2026 16:59:30 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] PCI: brcmstb: Remove redundant const specifier for
 struct fields
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
 <20260911233541.1650895-2-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-2-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/11/26 16:35, Jim Quinlan wrote:
> All of the variables using this particular structure are declared as const.
> There is no reason to declare its individual fields as being const.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
