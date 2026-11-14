Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626934;
	b=nMozIKbFe8fgs9ImuDOaZ5bMd5jM9+ZHJz+DlVbtCmbs+DCtWMmWkw2E7NErwlMGvF2z
	 qopipzsxNMMoHxcX4SJAYklBe/NZIrvFrJ8YGkAJPL6hxCkk+IHUyq1Ios7EKVXTXFLUt
	 uW6LXByEQ1fYlZnns7PXgQiT7KdJRtpZw4oUO/h+e+FmqfEezaWOSIewU/8ShVIra7JLt
	 04hrpFyKNHngah31Z05ZXbZ8jnXD5zq4rujHn8oa8vaXwW7Q6PwMrlni3oKJIGZYJNgZV
	 0Alk4U9SMIWjI9+9DRdk293jqXBD8wi5DRNLRH0Se4Fsc3KOksNDab6X1lk+slP0AnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626934;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=G905XYAjc6fuP5+esWv3pY8cINFOYDYWIQYBCDdTSIM=;
	b=YnCPL8O1CrDi2xJ2LPIaM/guO2DqZPgYAKozQ896LlEV8ck95HF8sYBhy8nKCGj6yXP6
	 1XJH1REfx59D/uzkw6NzguSRuXmO5bWO50O7NHU+ujQyJGQnIC8dPdvqw/xcpjLg0bFW7
	 PM28zKnstpCN3SUIN1HtEX5cgOM2uveQNXSdBIKs0jLhMus4VHBprlU/kg92Xy5Pc1avd
	 TJbZA2wK48rn/fvkaex4NyY9p3JBoAXWOi72IHd4Z+76zhLjax4dEfWHnVQ+0ij1IgpuO
	 CJvGIIgvV/bxGbfdtTE7WoKqEaT/u70bFMwPasWdKL/03T7CzQKkHnMiUslABbG9KNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="dKt/qZ+P";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9811C606A894
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9811C606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dKt/qZ+P
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso852092a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626933; x=1795231733;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G905XYAjc6fuP5+esWv3pY8cINFOYDYWIQYBCDdTSIM=;
        b=kUcKBqWzxB+ogm81duN3fWcl4nOpvRQYeVtsAtVsQaPObLoXzjhGZOpnccnfExdviJ
         euGkSTqJapqJ+OHTlBspjLD4aAW7jUbj0DAURrrxU363qKEotv7nFTuT1DogPrEslVbR
         C5FoihNkj4DkH2g1N13XJ5ccM5m4WfpQtT01M+sz4jg3RiRllcfd4bpFGX40+Ww9dSPn
         FPsRbyTfgXNkfQkY9FHAadXuM6FDWhhcJubFJv4FP3ZJrcdA2Bq5AFYrdkGAmLs4v13C
         erGFuW9/86Cfk/STg7ljBHt9kxKWKt4cU5LMN3qyH0ydqlRxnUSnNuExDUgOcpz0v3fG
         xSOA==
X-Forwarded-Encrypted: i=1; AL+hErEe+HTKqj3j+RPA6jvlDGSrIKZBz7YPrEOr+IlHzNnHDbCmX5NdcGy0UDDis5evCCmioz27mEI9R26caR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/pCoQQrr9Sw10FMreW0Wgfpo5WJJXQAKHk65JQjGPwlst7kvQ
	elrPcWsIEFPfcxCm2pdqkVI0I2zTpCCcp3RXLLO3Nt4NwJ84Pf72cFW/JglKoUOX3bVJXHZ/XH/
	65D10/GK0eGqnXxfaLqv4KdmP4FkWysFNXjxMZwPviT/t1wJ2aOSUsz7A/ukIsL1mlODr/a54bU
	PvY6GYjC2nv89O/HqLqIGG1nq6qT/IgbDLrM73vuwZUFtNizwdOOXncUfil8QYaPAQkvH+p7RWn
	QxremZydOy95TGP+UzaqWjo
X-Gm-Gg: AYBFou0/WHbDOPOSgIJjopEHelLwfJBvishNjg6QkyJAzid75i/DwMaJDlIKRWvi0rd
	0fcja5h6rwtVHPjd793KuGkOvYLudAKC2KsWrV3Kj0ejicXcAKU+KaSaMW2uZaxScyFu8CJGkiL
	9xQcLgmrJEA+tFBICqDX1DHXJfPuodrarIbSKk1VXRYZbnPeviV4qYws3Ajec4enizzZFb+5FdE
	BhKNiayqGBPcxz2ZEk6MVKQGYo5DHVZRiFIc1aYto9JXD2gT9mZqXtkfgNxSRMhQzl7E1RYQVri
	HO5NfaFrr/Xk1yBwcl9Rkwk+EeKu4xhPAmg4jtXz6237BmORIYbYyigMNApElzamVkbg3+zIEsx
	nv+F14+DzNbE5VC8gqpHJgs5SA08ovX1p8oVt7sYHzl6Hqyd7gkk4TxMVoo9OiyOlbeUWJgaCDP
	2WPkd+F/tbqpb1UnFFuEKKZTGlanyOWx4IE9l73r5t
X-Received: by 2002:a17:90b:52c5:b0:3b0:d551:ab2 with SMTP id 98e67ed59e1d1-3b1b0b5d61cmr4406872a91.51.1794626932911;
        Fri, 13 Nov 2026 19:28:52 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b24cf7ecsm3083310a91.2.2026.11.13.19.28.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:28:52 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso1827963c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626931; x=1795231731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G905XYAjc6fuP5+esWv3pY8cINFOYDYWIQYBCDdTSIM=;
        b=dKt/qZ+PwIgUmb8M4r9pGTfb6iaeSmZIMyxtuaDYwxdLiSQWnJZ2SIsmsmeDEck+rM
         BrDwIuJILXQv2iJxEiMXa/q0tTgX7X7qLw2oNgVXLpeGgKqVSnZCb//6dci+ndzyGPYc
         x63LDZz81NAn2v9WZRNGKN1cauP4KwtkkZgs4=
X-Forwarded-Encrypted: i=1; AL+hErGNHYo48UMpQLF2KBaZJzSgL2vwy4yvyhz0sdh2AbtxifGDi4xy0ds7UZYRw200Vw+bfvoKEFjrNkHJqNc=@vger.kernel.org
X-Received: by 2002:a05:701b:208d:b0:136:c443:80e5 with SMTP id a92af1059eb24-1b5030555a6mr3611164c88.6.1794626930875;
        Fri, 13 Nov 2026 19:28:50 -0800 (PST)
X-Received: by 2002:a05:701b:208d:b0:136:c443:80e5 with SMTP id a92af1059eb24-1b5030555a6mr3611139c88.6.1794626930062;
        Fri, 13 Nov 2026 19:28:50 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm11190793eec.22.2026.11.13.19.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:28:49 -0800 (PST)
Message-ID: <425e74b9-11a6-45b7-8bd6-c3fa6c66076e@broadcom.com>
Date: Fri, 13 Nov 2026 19:28:46 -0800
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
Subject: Re: [PATCH v5 03/11] platform/raspberrypi: Add VideoCore shared
 memory support
To: Jai Luthra <jai.luthra@ideasonboard.com>, Stefan Wahren
 <wahrenst@gmx.net>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Dom Cobley <popcornmix@gmail.com>,
 Alexander Winkowski <dereference23@outlook.com>,
 Juerg Haefliger <juerg.haefliger@canonical.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
 <20261112-b4-vc-sm-cma-v5-3-d25e3b687e71@ideasonboard.com>
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
In-Reply-To: <20261112-b4-vc-sm-cma-v5-3-d25e3b687e71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/12/2026 3:18 AM, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Add support for the vc-sm-cma driver, to enable sharing of contiguous
> CMA memory allocations with the VideoCore VPU on Raspberry Pi. The
> driver allocates CMA-backed buffers, imports external dmabufs, and
> manages their lifetime via VCHIQ messaging to the VPU service, ensuring
> buffers are not released until both the linux userspace and the VPU
> confirm completion.
> 
> VC4 can only physically address the lower 1GB of RAM and requires
> buffers to be mapped through specific uncached address aliases
> (0xC0000000). Thus, standard CMA could not be used as it has no
> mechanism to ensure allocations are visible and valid to VideoCore
> firmware, or handle cache flushes as VC4 can't see ARM's cache state.
> 
> The vc-sm-cma driver bridges this gap by allocating memory via CMA on
> the ARM side and explicitly importing it into VideoCore via VCHI.
> 
> This driver is primarily used by the wrapper V4L2 drivers for codec and
> ISP, where firmware running on VC4 does the actual video and image
> processing, while the linux userspace interacts with standard V4L2
> driver interfaces. For example, the ISP driver populates large
> lens-shading related tables for a particular camera setup, and uses
> vc-sm-cma to share this buffer with VC4.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Alexander Winkowski <dereference23@outlook.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> [clean-up for mainline and switch to xarray instead of idr]
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, 
thanks!
-- 
Florian

