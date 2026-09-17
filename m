Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC87E4E4C5E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659762; cv=none; b=b0MoIs2NUJf4iOsTlXP/3gHEHvHGLgn7h9lyLs9+lvCl49BaeoWQ7oO8s1n05cclZeF3bW9Di/pPDKqpeRXfUjiKXzd4aTp/Kw2NYnXCNHjCpwHj7IcJnx9w9vQChhu1bx32DoYtSU4YZ86xiS2EDJwwj1oxuPfgiD9IpDnwhkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659762; c=relaxed/simple;
	bh=hyL4l6gsmgmtX1b3W7XCRQGJBNB9Ha956w655VCLz6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZaEUMqKSJPD18tCeULPCGY8siZdjT4D7aIM90n5+dnmDtZDKHNWo1z9nK4169IeGwCh4/mVP6vpEJZwJTX0w5MRrNYXVeKZS24fiGSyo5eObQB+zfw73gXDOXbtAGvodpB/JucttWJ43VnR5Zf5QbTbPJQm2iwdoqfXpwux7cAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=h3N4464C; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="h3N4464C"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-398a5aad413so170127a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659752; x=1790264552;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=433oK2fFssb3QgVyulQTmFH5yk5eaGQ9l/CFVdPQ6nI=;
        b=0EeIQ0hw53mgszQ7KUIOBEl/34LjdF4jrfjc8sSlZHjtphFxCusjEHn90Ie48oHSjC
         n99Epqfp1b0Ly+kmG4RrRIwQsna1my7Ufm3UJH2QzjesN2yvPH+S2B4FSPgz6qrOoKds
         HVUWlKN89jVY2IrZRGpSEpppOuEO7Y5gnxmId6bJ0qCtCMhAqXwvxij4RmJ285wAQaeP
         liBTcBdVDnRQneb52xzFiaAnQ6HNighssmCObtrnqFgznjHp/HtORB4WWkxTrtKsDGzl
         z9FMYnm+KEUfUyU3PGTAsjAAkx4vlKp50+Wtakt9Ka0zTNu3Sd1Xc2VYS1KOeAAFPHnP
         Lr7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxz2ruCjriHOhd0HAiVTqvsN66df/RFKFzTclubZ991JyP6k7pSP2W42k5tkvlQsJlr2FFGQ1c3QaB9VFA=@vger.kernel.org
X-Gm-Message-State: AFuF++llLdbZbQJxzgfosyYD6emkynHqqV9Dbc7GTuN56T5kxam4pyc2
	yrH12gHftm3cAtkd2kCh6v/aIyh+xBnixMzJ7fEren7EWh3npE1Jj+FZYVNkq0ucnJXkCMa8DkY
	6QKujYffsZreq6FUf7lvmU0ZRb5qC5rGpvHEjv7Cks4aGnHHnuiKyCYwJOQAT0ig9XnhyvnAuE0
	ioPzcT3CuGzqRazmX1+B4t7HtREOcp/P4ZB1Vuz3Ol//t7VFVX5kCVKirGiSqk2RzI9tPDmlO8e
	OJxVDKEFNPJLRnMBKhliPGA
X-Gm-Gg: AYBFou1LSFeSQSQjzLFremQN7KW40XWHcdNkDLy1hMR0k6ndsjDnOsqPiWI2Ea2vytp
	iwI30BUqorJ3pG+3lddn8CojBQnxjl96AWew5iFGSCB26FJnNjthxMN9FgPD5OAdSeTGsBmR2Bu
	vyB2o7NTTQ3IukAkGs9VZ7h9Pcb25drPlWCn/pGqaXl7dtRAgsOAnXziITfKcpKJny1c6jzG2mE
	LBb9+2gzO0/z3pAzzsBDyCPw+r+C/+ozyjgGO/WknYdIhsiAjU5WDiWfORPqwp5GwHVawYKz7ff
	L/u8OPe1kRlw+IkNgyFKrjqbp66Pd8B/A1wWp82kSVc5fqRw5f0SwpCgxx2ogV7qFDp6lzHLsSF
	IYoM1LiQFXRWK0zRPrCbktVch6+YhGUgQFs0WFpm2d8KYudDDbtJn/IwsViFs/qeIZ8y1PnxmC9
	jN/2OQJ353P5tpyw6L7mzJJo97hdS1Pg/A9mJnC3vX
X-Received: by 2002:a17:90b:2f4f:b0:398:990e:1587 with SMTP id 98e67ed59e1d1-39e1e3024fdmr16674166a91.9.1789659752024;
        Thu, 17 Sep 2026 08:42:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e35d7c196sm1784409a91.2.2026.09.17.08.42.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 08:42:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91043af01d9so23970416d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789659750; x=1790264550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=433oK2fFssb3QgVyulQTmFH5yk5eaGQ9l/CFVdPQ6nI=;
        b=h3N4464C7CZA2pqTAF4Q3gKzSpFp3iRhIrCbMLO+h338GyvK1nUTvITziFHsxA4b1Q
         p7PMVGkZsq3ZZC/AAr31GH4fI7z1LSf8ltpZH8vADPh2mku6EVSJuAQtOsCgjEUfKiuA
         fZuxuvlnR5btx9Yih91iQEhWkKIWmg8ZL/xfg=
X-Forwarded-Encrypted: i=1; AKwUvBwVMuUOXgt4GHx9DGw7gFs+Mv1luzL9u86nwniC7SkbxGDzMVeOWT0rMkEuF3tWWMlgkMMLlBGNeVk2d+A=@vger.kernel.org
X-Received: by 2002:a05:6214:6019:b0:912:3fc7:2336 with SMTP id 6a1803df08f44-9123fc728c0mr110397536d6.31.1789659749821;
        Thu, 17 Sep 2026 08:42:29 -0700 (PDT)
X-Received: by 2002:a05:6214:6019:b0:912:3fc7:2336 with SMTP id 6a1803df08f44-9123fc728c0mr110396976d6.31.1789659749330;
        Thu, 17 Sep 2026 08:42:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252b69095sm967276d6.3.2026.09.17.08.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 08:42:28 -0700 (PDT)
Message-ID: <5d9446a5-d237-4a9b-abbc-a7dfbaf875ac@broadcom.com>
Date: Thu, 17 Sep 2026 08:42:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: phy: Fix device_set_wakeup_enable() reference
 in kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917063051.52727-1-kmehltretter@gmail.com>
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
In-Reply-To: <20260917063051.52727-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/16/26 23:30, Karl Mehltretter wrote:
> The phy_may_wakeup() documentation refers to
> device_set_wakeup_enabled(), but the function is named
> device_set_wakeup_enable(). Correct the reference.
> 
> Fixes: b344bfacf1de ("net: phy: add phy_may_wakeup()")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
