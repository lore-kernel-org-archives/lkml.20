Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9648F31D362
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821974; cv=none; b=eVMtCtpXb34qs8Acdjj0JPZkVSsc6wCDJfji3MkjD0tCwLF8D+0x5ANN4Bqn1NOSQNJWR5FRajgXtVexiFAUrN4kd5ULEiANcae1DPXeu+LLSOyfdgFP2bsun+LPYAI72LJiqTCnMti/xHeu3g1jV1nk/pbXzJkbL0cImdhX6Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821974; c=relaxed/simple;
	bh=ked8IN+htAgfwtbEdDRvW61h91AbL/a+nHxw+I8JzxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQ0e6fRTlCyz0a0dnQcYr4kDfy6sYQvCsiEm8OcDG/hW/Z6d4sJ1oaVoK7O8h5Equlb9zg+d2SOVIpEqRnGoYjJ04xhBSyDsHfe5IiDXT65fyhnbURP//C2635dS112Cr0V4zOCR6YEAXhO5jvBwatfh6qWh40IbSprdco/naHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fMucICpX; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fMucICpX"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2e618db81c0so17237045ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821973; x=1792426773;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vRGdhpzpgBIB8Wn9L7geEKuubi449G7vuDBdHmN4gRQ=;
        b=l0EZCIhiDJBsrB4Rsa8N99xMFukZX6G4ejaeirVJvur2zBeq4v0FL7S7Ra0PE906Ef
         xq0UvIIW2ajKwmktP+pNt92iurY5Cn0gfFhyu6IaxGr/JuuJlnwcClkLA2D8khukxnp7
         uxnbyQD/vcqd5SbJxJdt4jUUuVytiErrhN5bWnpEjyQRo6BRUrGg1Sz15n2w5LuF75vz
         O1ZTz8517n+vXGiW+ckRXiWnE6AXqznViOMVAU5xhtJh5E1TmJvP7o4K2sSXBZKQ9lvC
         kQe+TVc/oVVw3QAYgbtjVRDY2WpUHMAb9/gnuc3Ge230uTSV0nHCRDtxjOKUnbbibMuY
         rAug==
X-Forwarded-Encrypted: i=1; AKwUvByMpoIFnfpHC1H10WXnZuPk4VWrpvbhI2LTUuNgOZyMmDRo+/o+kglUZiwHZFsdg8IU8McMznO7WwTIC/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlqdgaeBgBnGdZ5DrUR5KzfsdSWCH89inKB9+COAZEEVo4oULk
	8GV6aCxdJjRRViOM1972dpeMIgRdPuwb4wFej+ee2HdHfD/9Af+lvvtIlUEfcGMexAxPh6RDfGX
	Fp/p/EDg91yLGgClOkSUz1X36nyG+t/o9jCB17nvOoaHby9MC5y4HYxNfTo78zBqBOsFRxwECXw
	bUUGwgChJLumrqDppegkIyWoNEQQs27CS96SK3zYlqQ0ZmdXI5QkKoq5x1Uw9e2DYMlUs/yXOPa
	/zsTrhBls0F/RRawOYtsFsU
X-Gm-Gg: AYBFou2FkmSrQ9JIJWQA+6qrLgo6W5/J2hIeWDTwL9NYR8WTbuXtV8Zw/hPLcqw+lBN
	e2fvXNqR0uyhjR2iQZg6CzdYBM2aRVNuS5agoHOtHPzSBMYY9Aeg//Y6b5i04x3QhHyGjqLJifL
	GxkXhARKl7l09bfoJ6SWp5NUv3H00Y1qBE5Wh8f9VaXdot55eWIt/YfJ2nyorcUMY4G/u4700na
	LKIPm5KAQ41uH9ZLv2lP8dL4Ks/dS7esvI5xstUynb9vnkKz/R9FskGo7gbioUy6X1KI6rmKlOE
	9U3FsB3tXADojLBOFZcVWz1cmnhkLQxLqq5DW8mf/JW6dLXsC+sskOa8v3ZGl2aSfcKLmZnr5CD
	Rv4Rtl+wrjqIP5WDT1ScEwf+mvQtWX8d0qkT3QStbjPWCSxEospeEzouOKoUbgOo6s1HduKkDaB
	cnuRjtexmcMFzCXRyZk3ljgT0Ue9UGaK83M15zUjJ4wKg=
X-Received: by 2002:a17:903:2a87:b0:2e5:ca81:1399 with SMTP id d9443c01a7336-2e842cfd1bbmr95561195ad.31.1791821972815;
        Mon, 12 Oct 2026 09:19:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2e841e762f6sm3682445ad.11.2026.10.12.09.19.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:19:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a4d2e39acso4461300eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791821971; x=1792426771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRGdhpzpgBIB8Wn9L7geEKuubi449G7vuDBdHmN4gRQ=;
        b=fMucICpXOklRwhVe54akD7qktBagOVLnGdAFAYXaghJJ8Jd6pSWpiT7dgCqy7sPQiD
         24f4eQ2YQ1PBFRYkd/4kStxsefx2poHcBk/NbcYcBXAooPoDtxslRUFsDr2kzplzH8Ub
         zC7nNHsCJ4vZvBLyi12hCWUXhvgwT298nsgxA=
X-Forwarded-Encrypted: i=1; AKwUvBy0I0A+K9FWHwJ0yZnr1APUUSV2VjDPgGQq1I7c7ZoIcgCME10alo2BIRPJNi6ldfnxz0YChRlMTcRxlzs=@vger.kernel.org
X-Received: by 2002:a05:693c:88c8:20b0:359:9302:a526 with SMTP id 5a478bee46e88-3599302a70cmr7297841eec.7.1791821970691;
        Mon, 12 Oct 2026 09:19:30 -0700 (PDT)
X-Received: by 2002:a05:693c:88c8:20b0:359:9302:a526 with SMTP id 5a478bee46e88-3599302a70cmr7297784eec.7.1791821969846;
        Mon, 12 Oct 2026 09:19:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm24226946eec.15.2026.10.12.09.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:19:29 -0700 (PDT)
Message-ID: <be539c4d-de74-4f1a-b5cf-98d074a6d0f3@broadcom.com>
Date: Mon, 12 Oct 2026 09:19:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org,
 Scott Branden <scott.branden@broadcom.com>, Ray Jui <ray.jui@broadcom.com>
References: <20261011085254.603765-1-jirislaby@kernel.org>
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
In-Reply-To: <20261011085254.603765-1-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/11/26 01:52, Jiri Slaby (SUSE) wrote:
> Both are bouncing:
>    Final-Recipient: rfc822; rjui@broadcom.com
>    Action: failed
>    Status: 5.1.3
>    Diagnostic-Code: smtp; The email account that you tried to reach does
>      not exist. Please try double-checking the recipient's email address
>      for typos or unnecessary spaces.
> 
> According to Florian, it should be first.lastname@broadcom.com.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Link: https://lore.kernel.org/all/688738af-100b-48af-bee1-4bcbe4422f94@broadcom.com
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Scott Branden <scott.branden@broadcom.com>
> Cc: Ray Jui <ray.jui@broadcom.com>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>

Thanks!
-- 
Florian
