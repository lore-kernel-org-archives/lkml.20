Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042235;
	b=yd4UdkzihFBTOoPmUoAa1FQxV9RaZ1eFYS3V3HOYnfQ9saGtf4FduUqMYCd5bp6QmlEO
	 H+4JRkctW8SjpUrXTgOU1qGqdoei8L11sBYr1+qE56KvYd4+3S87nJ8yF/ScHHJrusfvB
	 Ex6UULoafBqEkb7nffXeGJhkrKXI6FtxVUegA9xGUzIis1Z6XRQiVTfZ04OMWRkE7uEZe
	 9Rb8QqckwzIR9jxMeaQrt6ajY8xT7xhzLJby/2A4xX/9pLbb+VekvuJYOZB7kRh0SWbV7
	 yMXjLvE/8BQDVTvJ0qdPY/lnJY7dT3G7r/Ayx01Kues10vDLQBayGKsOrfcbG3l/Zjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042235;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=BdfLZ3+TQnhk/1R/dKHjB/gyQ9lcXQ2fJWw3eaIlqVQ=;
	b=VwwMc+hVso6vL0BnThlFm60PRRDJhKzCmUJIfv+xvwqmpbTwBtrsN+m1fmxSNLUwhQp9
	 6U+kqHXbiOe5HeG7ryM+kqeNcwJuvOwgKQrHcDW1QElV8UhV8ZlHAP1B3M3nL0Qls/c+Y
	 Uk061l4ahoDaSv/ZE2I1n1Tqxt4GJDxLCKu2T1SP+imGZ9KkDy2k8WX1D3JkNp9JngMLW
	 IU6Hsj0f16zCvGI08vWhPbqtxzcxd0YrF7KDU4fvwzG1xt+lVoCNVf9zgY3jUS8+5URDm
	 mJjDMX6zoL63aoLXNGUZtbxq5dCHH9xI8WT3gw2jsd2/BPA+jv+8tlYWNUUcOSEqhJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JYlooF6f;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09D0606A331
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D09D0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JYlooF6f
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ab41538192so2491431a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042234; x=1793647034;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BdfLZ3+TQnhk/1R/dKHjB/gyQ9lcXQ2fJWw3eaIlqVQ=;
        b=NjX2l67ucvn52xiIq31b2LLvTpVQ5Dt36eyeW7nHSL83b5Aawbv9GLo/0l47l9M9ow
         hZdtzX1chnr8PZAnP2XeeNQMzMmqsbrhvJ8/gG8z6ZX8NxBzdM49jQTLyBvG8Sml3OLP
         NarpU0Mnb1A4uo8ehqxi2wjKhxx6a7ArUP0UW7akFxoB7HMmsJGtBdrbHrdnj6zXv5tJ
         EgSiSFTUNU4V4Srpa8dgwBK4Au5xoK6safLu/t/DGgFv6EDXRn7R/8ythUNfsD+rgmfj
         27LisU8lAycSUV+m0dsX7jcna6lUn1vN3NP3Rr3ObJwjHPF5kxZy5oDcQ+yZmiLf16ol
         1c/Q==
X-Gm-Message-State: AFq9FYLmoDaRC0dSwIa+4+r3CiCKyLWaNCZr9Uhmt2Gm+oqKK/AFOeRy
	8kzM2ClsgC/xl7nkLBw4HlkJLMJXUo+j97Spdhc9/6ogcTFWIyKJC585k6gHza6Pnq4rrwncv2z
	PwAXXJjDyUrCghDchtilFU2i4IUvlZthYjAuDkx1932Zw4h/lxyLhgLMfEMtQbVrcy+IuyJFkcw
	jdiW7qq1Xm2+RrL9tz5sQxkL7Lzu3H3+RMxh5ArRsZT5OIY7IjLyG8EgTiYV9Eilgve3f4S6lXe
	VzBF5Yyiv4Ymjo9ZwhyH+72wJU=
X-Gm-Gg: AYBFou3NAe4pXEY2+CzM7xVCDA5+rrb4m5zmvcKAl+O6n9mnqKACGImwTDsh3xW1eUS
	7c7Ci2rEp35xrgMjUTaCtTLAYnv7lhW3f54/hJ1R+RsUX02J+jLoceiHXvj1J51RNn1hCiVmKAC
	5NTaQ3EcOr7Aeht4PYv6+wNpGIMxTFS3/HtZdLrQFlPnzjmqkv9CMsdP84TN3x3QkUh6g2ffAKI
	C/CN5EBWCFwXShXDZpT4UeLLe+wHlh49hXZEeoF+Af6XUS1FyJHBxdwh7MlkkhHzef1IZUsjLyR
	4FkIdClxUrqMTdE1SsxwZ+Ruj5l8M2fp2PrjDnYFbGidX8sMjCaerLWKv82PD+oc+YeQFyAK/Kw
	a7PVE9qbD0gX9xsfXBnA4r2xOXH1zd3b9V6BAT0sWtBMwT2bwBT3Af/5scksRhR4/W6G+Hg7fQK
	VG7F53NvqaH2tOlB8I6/xLgk35hwFj393cDmwzI5+jIWU=
X-Received: by 2002:a17:90b:280c:b0:3ad:870d:1bfa with SMTP id 98e67ed59e1d1-3adead57cbfmr5972988a91.23.1793042234236;
        Mon, 26 Oct 2026 12:17:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae404ce404sm355760a91.2.2026.10.26.12.17.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:17:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91785bd637bso83228586d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042233; x=1793647033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdfLZ3+TQnhk/1R/dKHjB/gyQ9lcXQ2fJWw3eaIlqVQ=;
        b=JYlooF6fUCxKIr+zDxP133KEWGIffRYSFU0z/Rq6wGo0/uSh5WPdl4OSt/ex+9Lcj3
         RG6v6Td5SbUG6Zfppih8yKtZv15CKXTSgtK+CKKOKLuEQiiZyBlSGYUwUvHoBLL560Bt
         duDg7b55ic2+KHj6DJPR/TPzIkhxIvbYmr9+k=
X-Received: by 2002:a05:6214:2602:b0:91b:83b7:b9c3 with SMTP id 6a1803df08f44-91c48cefde5mr132806966d6.5.1793042233023;
        Mon, 26 Oct 2026 12:17:13 -0700 (PDT)
X-Received: by 2002:a05:6214:2602:b0:91b:83b7:b9c3 with SMTP id 6a1803df08f44-91c48cefde5mr132806056d6.5.1793042232303;
        Mon, 26 Oct 2026 12:17:12 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47ce49d9sm80619336d6.45.2026.10.26.12.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:17:11 -0700 (PDT)
Message-ID: <6cf34238-ed4e-477c-938f-f5d6910fda1d@broadcom.com>
Date: Mon, 26 Oct 2026 12:17:08 -0700
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
Subject: Re: [PATCH v2 3/6] ata: ahci_brcm: Initialize the NSP interface clock
 and reset
To: linux-kernel@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM IPROC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
 <20261026182856.3168686-4-florian.fainelli@broadcom.com>
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
In-Reply-To: <20261026182856.3168686-4-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/26/26 11:28, Florian Fainelli wrote:
> The NSP probe path assumes firmware has enabled the SATA IDM interface
> clock and released the core reset. The downstream iProc config_AHCI()
> sequence explicitly performs both operations before accessing AHCI.
> Without that setup, a cold boot can access an inactive controller.
> 
> Map the optional NSP IDM register region and enable the interface clock
> before releasing reset, retaining the downstream settling intervals.
> Perform the sequence at probe and resume before reconfiguring SATA.
> 
> Keep the resource optional so older device trees continue to rely on
> firmware initialization.
> 
> Fixes: 3ee2e6dcaa35 ("ata: ahci_brcm: Add support for Broadcom NSP SoC")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Apologies, this is the same as v1, I will resubmit in a short while.
-- 
Florian
